#!/bin/bash
# Copyright (c) 2019 Pietro Albini <pietro@pietroalbini.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

_pv_loaded_vars=""
_pv_ps1_added=0

_pv_bashrc_before() {
    echo -n "\e[1;31m[vars:${_pv_loaded_vars}]\e[0m "
}

pv() {
    if [[ "$#" -ne 1 ]]; then
        echo "usage: pv <vars>"
        echo
        pass vars
        return 1
    fi
    var="$1"

    # Include the vars
    eval "$(pass "vars/${var}")"

    # Update the PS1
    if [[ "${_pv_loaded_vars}" != "" ]]; then
        _pv_loaded_vars="${_pv_loaded_vars},${var}"
    else
        _pv_loaded_vars="${var}"
    fi
    if [[ "${_pv_ps1_added}" -eq 0 ]]; then
        bashrc_ps1_before _pv_bashrc_before
        _pv_ps1_added=1
    fi
}
