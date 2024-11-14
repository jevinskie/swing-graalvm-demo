#!/usr/bin/env zsh

set -xeuo pipefail

echo "Creating native image ... "
native-image \
             --verbose \
             -H:ConfigurationFileDirectories=config \
             -Djava.awt.headless=false \
             --initialize-at-build-time=jdk.internal.util.SystemProps,jdk.internal.util.SystemProps.initProperties,jdk.internal.util.SystemProps.Raw,jdk.internal.util.SystemProps.Raw.propDefault \
             --native-image-info \
             --diagnostics-mode \
             -J-Xmx12G \
             -O0 -g --diagnostics-mode --enable-preview \
             -jar flatlaf-demo-3.4.1.jar \
             -o demo

            #  --emit build-report \
            #  --enable-sbom \
#             -enablesystemassertions \


# if [[ -x demo ]]; then
#     echo "Compressing executable ... "
#     rm -f demo-upx
#     upx -o demo-upx demo
# else
#     echo "Build failed"
#     exit 1
# fi
