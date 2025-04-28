FROM solarkennedy/ipmi-kvm-docker:latest

RUN ( \
    echo "jdk.certpath.disabledAlgorithms="; \
    echo "jdk.jar.disabledAlgorithms="; \
    echo "jdk.tls.disabledAlgorithms=" \
    ) | \
    tee -a /etc/java-7-openjdk/security/java.security | \
    tee -a /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security
