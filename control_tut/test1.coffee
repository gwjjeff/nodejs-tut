control = require 'control'
task = control.task

task 'mycluster', 'config for my cluster', ->
    config =
        'localhost':
            user: 'hnyx'
        'www.tongyishangcheng.com':
            user: 'hnyx'
    return control.controllers config

task 'date', 'get date', (controller) ->
    controller.ssh 'date'

control.begin()
