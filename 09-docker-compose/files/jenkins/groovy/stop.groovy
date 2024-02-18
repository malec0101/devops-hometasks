#!groovy
def stopProcess(String processName) {
    def command = "pkill -f $processName"
    def process = command.execute()
    process.waitFor()
    println " $processName stop "
}

stopProcess("jenkins.war")
