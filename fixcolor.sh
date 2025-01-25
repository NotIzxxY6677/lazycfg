#!/bin/bash

sudo bash -c 'cat > /usr/local/bin/intel-wayland-fix-full-color <<EOF
#!/bin/bash

readarray -t proptest_result <<<"\$(/usr/bin/proptest -M i915 -D /dev/dri/card0 | grep -E \'Broadcast|Connector\')"

for ((i = 0; i < \${#proptest_result[*]}; i += 2)); do
    connector=\$(echo \${proptest_result[i]} | awk \x27{print \$2}\x27)
    connector_id=\$(echo \${proptest_result[i + 1]} | awk \x27{print \$1}\x27)

    /usr/bin/proptest -M i915 \$connector connector \$connector_id 1
done
EOF'

sudo chmod +x /usr/local/bin/intel-wayland-fix-full-color