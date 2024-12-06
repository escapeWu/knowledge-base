---
{"dg-publish":true,"permalink":"/01-frontend/build/ci-cd/gitlab-cicd/","title":"gitlab CI/CD 入门","tags":["dev-tool"],"created":"2024-12-06T13:25:11.828+08:00","updated":"2024-12-06T14:40:52.204+08:00"}
---

#### ANKI-CI/CD是什么？
CI/CD，代表持续集成（Continuous Integration）和持续部署（Continuous Delivery/Continuous Deployment）
以gitlab-ci 文件为例说明具体区别
持续集成(代码打包)：
```python
stages:
  - build
build:
  stage: build
  script:
    - npm install
    - npm run build
```
持续部署(对打包文件部署,对应stage-deploy)
```python
stages:
  - build
  - deploy
build:
  stage: build
  script:
    - npm install
    - npm run build
deploy:
  stage: deploy
  script:
    - scp -r dist/* user@server:/path/to/deploy
```
ID: 1733467252184


## gitlab PipeLine 基础知识
gitlab 流水线（pipeline）有两个核心组件，runner 和 .gitlab-ci.yml 文件

#### ANKI-什么是gitlab-runner？
runner是指来负责运行定义在`.gitlab-ci.yml`文件中的脚本和命令（CI/CD）的程序，对于私有化部署的gitlab，需要自己注册runner来处理任务，需要额外关注 runner 的executor。
**runner 的作用级别：**
+ Instance Runner：全局runner，任意项目都可以使用它
+ Group Runner：项目组runner，只有这个组的项目才能使用它
+ Project Runner：项目runner，只针对某一个项目使用
**executor ：** 某一个job的执行者
+ Shell : 直接用宿主机的Shell 执行任务
	+ 优点：配置很简单, 适合简单使用
	+ 缺点：直接在宿主机上执行代码，==没办法隔离多个任务执行环境==，并且可能会有安全性问题
+ Docker Runner：任务在Docker 容器中执行
	+ 优点：解决shellRunner 的缺点
	+ 缺点：配置麻烦，==还需要用到DinD技术==，对于docker用的不熟练的人，是个灾难。
+ SSH Runner:  通过 SSH 登录远程主机，在远程环境中执行任务
+ Kubernets Runner：暂时没接触到
ID: 1733467252185


#### ANKI-介绍下.gitlab-ci.yml 文件的组成部分：
**stage**
在GitLab的Pipeline中，CI/CD过程被划分为多个阶段（stages），每个阶段包含了一组作业（jobs）。
```yaml
stages:
  - build
  - test
  - deploy
```
**Job**
在GitLab的Pipeline中，每个阶段（stage）可以进一步划分为一个或多个作业（jobs）。
```YAML
build_job:
  stage: build
  script:
    - echo "Building the project..."
    - build_command
```
+ `stage`：指定该作业属于哪个阶段。
- `script`：指定在执行该作业时要运行的命令列表。可以是构建命令、测试命令或任何其他shell命令。
**rules**
rules定义了job 的触发时机，比如设置只有commit 到master分支才出发ci
```yaml
build_job:
  stage: build
  script:
    - echo "Building the project..."
  rules:
    - if: '$CI_COMMIT_BRANCH == "master"'  # 仅在 master 分支触发
```
**tags**
tags参数的作用是指定执行job的runner。
```yaml
build_job:
  stage: build
  tags: 
    - runner1
  script:
    - echo "Building the project..."
    - build_command
```
**before_script**：定义在运行PipeLine前执行的命令。
```
before_script:
  - chmod +x ./gradlew
  - ./gradlew clean
```
**variables**：统一定义.gitlab-ci.yml需要用到的变量
```yaml
variables:
  GITLAB_CI_BUILD_ROOT_PATH: "gitlabci"
  GITLAB_CI_BUILD_SCRIPT_PATH: "${GITLAB_CI_BUILD_ROOT_PATH}/scripts"
....
当需要使用时，只需使用$或者${}将变量名包裹起来，如使用GITLAB_CI_BUILD_SCRIPT_PATH时。
- source ${GITLAB_CI_BUILD_SCRIPT_PATH}/gitlabci-envsetup.sh
```
ID: 1733467252186


#### ANKI-gitlab runner 有哪些常用executor 类型？给出具体代码使用示例？
shell executor
```yaml
stages:
  - deploy
deploy-job:
  stage: deploy
  script:
    - echo "Running on SSH Executor"
    - uptime
    - echo "Deployment completed!"
```
Docker executor
```yaml
stages:
  - build
  - test
build-job:
  stage: build
  image: maven:3.8.4-jdk-11
  script:
    - echo "Running in Docker Executor"
    - mvn --version
    - echo "Build completed!"
test-job:
  stage: test
  image: python:3.9
  script:
    - echo "Running tests in Docker Executor"
    - python --version
    - echo "Tests completed!"
```
ssh executor:
SSH Executor 通过 SSH 登录远程主机，在远程环境中执行任务。
配置ssh executor：
```toml
[[runners]]
  name = "SSH Runner"
  url = "https://gitlab.com/"
  token = "your-registration-token"
  executor = "ssh"
  [runners.ssh]
    user = "remote-user"
    host = "192.168.1.100"
    port = "22"
    identity_file = "/path/to/private-key"
```
.gitlab-ci.yaml 示例：
```yaml
stages:
  - deploy
deploy-job:
  stage: deploy
  script:
    - echo "Running on SSH Executor"
    - uptime
    - echo "Deployment completed!"
```
ID: 1733467252187
