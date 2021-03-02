function junit() {
    java org.junit.runner.JUnitCore ${1};
}

function junitT() {
    cd "$PWD"
    junit ${1} > junit.txt
}
