#!/bin/sh

JAR="$HOME/.config/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar"
JAVA_HOME="$HOME/.sdkman/candidates/java/17.ea.33-open"
GRADLE_HOME=$HOME/gradle $JAVA_HOME/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.config/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac" \
  -data "${1:-$HOME/eclipse-workspace}" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

