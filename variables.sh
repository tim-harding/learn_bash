#!/bin/bash

file=thing/$(date +%Y%m%d).tar.gz
echo $file

function bash {
    local var="Local"
    echo $var
}

bash
echo $var # Not defined, prints nothing