# Ravago
set -x JAVA_HOME /opt/ibm_jdk_7
# set -x JAVA_HOME /opt/oracle_jdk_7
set PATH $JAVA_HOME/bin $PATH
set PATH /opt/apache-maven-3.5.4/bin $PATH
set -x MAVEN_OPTS "-Xms512m -Xmx3096m -XX:MaxPermSize=1024m"
set -x REPOROOT /home/jonaswouters/Projects/Ravago/