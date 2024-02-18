import jenkins.model.*
import java.util.logging.Logger
def logger = Logger.getLogger('''''')
def installed = false
def initialized = false
def pluginParameter = '''\
        antisamy-markup-formatter
	apache-httpcomponents-client-4-api
	bootstrap5-api
	bouncycastle-api
	branch-api
	caffeine-api
	checks-api
	cloudbees-folder
	command-launcher
	commons-httpclient3-api
	commons-lang3-api
	commons-text-api
	configuration-as-code
	credentials
	credentials-binding
	display-url-api
	durable-task
	echarts-api
	font-awesome-api
	git
	git-client
	golang
	gson-api
	instance-identity
	ionicons-api
	jackson2-api
	jakarta-activation-api
	jakarta-mail-api
	javax-activation-api
	javax-mail-api
	jaxb
	jdk-tool
	joda-time-api
	jquery3-api
	jsch
	json-api
	junit
	mailer
	matrix-project
	mina-sshd-api-common
	mina-sshd-api-core
	nexus-artifact-uploader
	pipeline-build-step
	pipeline-groovy-lib
	pipeline-input-step
	pipeline-milestone-step
	pipeline-model-api
	pipeline-model-definition
	pipeline-model-extensions
	pipeline-stage-step
	pipeline-stage-tags-metadata
	plain-credentials
	plugin-util-api
	prism-api
	resource-disposer
	scm-api
	script-security
	snakeyaml-api
	ssh
	ssh-credentials
	sshd
	structs
	timestamper
	trilead-api
	variant
	workflow-aggregator
	workflow-api
	workflow-basic-steps
	workflow-cps
	workflow-durable-task-step
	workflow-job
	workflow-multibranch
	workflow-scm-step
	workflow-step-api
	workflow-support
	ws-cleanup'''
def plugins = pluginParameter.split()
logger.info('''''' + plugins)
def instance = Jenkins.getInstance()
def pm = instance.getPluginManager()
def uc = instance.getUpdateCenter()
plugins.each {
    logger.info("Checking " + it)
    if (!pm.getPlugin(it)) {
        logger.info("Looking UpdateCenter for " + it)
        if (!initialized) {
            uc.updateAllSites()
            initialized = true
        }
        def plugin = uc.getPlugin(it)
        if (plugin) {
            logger.info("Installing " + it)
            def installFuture = plugin.deploy()
            while(!installFuture.isDone()) {
                logger.info("Waiting for plugin install: " + it)
                sleep(3000)
            }
            installed = true
        }
    }
}
if (installed) {
    logger.info("Plugins installed, initializing a restart!")
    instance.save()
    instance.restart()
}
