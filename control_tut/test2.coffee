control = require 'control'
task = control.task

task 'mycluster', 'config for my cluster', ->
    c = Object.create control.controller
    c.user = 'jeff'

    centosvm = Object.create c
    centosvm.address = 'centosvm'
    centosvm2 = Object.create c
    centosvm2.address = 'centosvm2'
    centosvm3 = Object.create c
    centosvm3.address = 'centosvm3'
    centosvm4 = Object.create c
    centosvm4.address = 'centosvm4'
    centosvm5 = Object.create c
    centosvm5.address = 'centosvm5'
    centosvm6 = Object.create c
    centosvm6.address = 'centosvm6'
    controllers = [centosvm, centosvm2, centosvm3, centosvm4, centosvm5, centosvm6]
        
    return controllers

# coffee test2.coffee mycluster date
task 'date', 'get date', (controller) ->
    controller.ssh 'date -u'
# coffee test2.coffee mycluster cmd 'mkdir -p temp/control_test'
task 'cmd', 'exe cmd', (controller) ->
    controller.ssh process.argv[4]
task 'scp', 'exe scp', (controller) ->
    controller.scp process.argv[4], process.argv[5]

control.begin()
