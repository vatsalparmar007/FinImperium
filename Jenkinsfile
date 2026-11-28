// FinImperium CI pipeline (part of the ZeroDown project).
// Runs on the Jenkins build agent (label "docker"):
//   Prepare -> Lint -> Build image -> Push to ECR (main branch only)
// Every image is tagged with the git commit SHA. ECR tags are immutable, so a SHA always
// means exactly one build.
pipeline {
  agent { label 'docker' }

  options {
    timestamps()
    timeout(time: 30, unit: 'MINUTES')
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }

  environment {
    AWS_REGION   = 'ap-south-1'
    ECR_REGISTRY = '770385968146.dkr.ecr.ap-south-1.amazonaws.com'
    ECR_REPO     = 'finimperium'
  }

  stages {
    stage('Prepare') {
      steps {
        script {
          env.GIT_SHA    = sh(script: 'git rev-parse --short=7 HEAD', returnStdout: true).trim()
          env.IMAGE      = "${env.ECR_REGISTRY}/${env.ECR_REPO}:${env.GIT_SHA}"
          env.BUILD_TIME = sh(script: 'date -u +%Y-%m-%dT%H:%M:%SZ', returnStdout: true).trim()
          currentBuild.displayName = "#${env.BUILD_NUMBER} ${env.GIT_SHA}"
        }
      }
    }

    stage('Lint') {
      steps {
        // The agent has no Node.js; lint runs in a throwaway Node container that matches the
        // Dockerfile's base image. --user keeps files in the workspace owned by the jenkins user.
        sh '''
          mkdir -p "$HOME/.npm"
          docker run --rm --user "$(id -u):$(id -g)" \
            -e HOME=/tmp -e npm_config_cache=/tmp/.npm -e CI=true \
            -v "$HOME/.npm:/tmp/.npm" -v "$WORKSPACE:/app" -w /app \
            node:22-alpine sh -c "npm ci --ignore-scripts --no-audit --no-fund && npm run lint"
        '''
      }
    }

    stage('Build image') {
      steps {
        // The Clerk publishable key is public (it ends up in the browser bundle), but Next.js needs
        // it at build time. It is kept in Jenkins credentials so it is not hard-coded in the repo.
        withCredentials([string(credentialsId: 'clerk-publishable-key', variable: 'CLERK_PK')]) {
          sh '''
            docker build \
              --build-arg NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY="$CLERK_PK" \
              --build-arg GIT_SHA="$GIT_SHA" \
              --build-arg BUILD_TIME="$BUILD_TIME" \
              -t "$IMAGE" .
          '''
        }
        sh 'docker image ls "$IMAGE" --format "Built {{.Repository}}:{{.Tag}} ({{.Size}})"'
      }
    }

    stage('Push to ECR') {
      when { branch 'main' }
      steps {
        // The agent's IAM role (zerodown-ci-role) allows ECR login and push to this one repository.
        sh '''
          aws ecr get-login-password --region "$AWS_REGION" \
            | docker login --username AWS --password-stdin "$ECR_REGISTRY"
          if aws ecr describe-images --region "$AWS_REGION" --repository-name "$ECR_REPO" \
               --image-ids imageTag="$GIT_SHA" >/dev/null 2>&1; then
            echo "Image $GIT_SHA is already in ECR (tags are immutable), skipping push."
          else
            docker push "$IMAGE"
          fi
        '''
      }
    }
  }

  post {
    always {
      // Keep the agent's disk small: remove this build's image, dangling layers and the workspace.
      sh '''
        docker logout "$ECR_REGISTRY" >/dev/null 2>&1 || true
        docker image rm "$IMAGE" >/dev/null 2>&1 || true
        docker image prune -f >/dev/null 2>&1 || true
      '''
      cleanWs()
    }
  }
}
