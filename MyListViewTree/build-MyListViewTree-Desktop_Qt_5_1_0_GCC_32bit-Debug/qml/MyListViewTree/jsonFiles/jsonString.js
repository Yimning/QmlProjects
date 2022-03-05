[
    {
        "title": "1. 网络问题",
        "content": "",
        "istitle": true,
        "subnodes": [
            {
                "title": "1-1. 无线网络连不上平台",
                "content": "1、确认服务器平台IP地址、端口号、MN号是否设置确定，通信链路是否选择无线。\n2、确认所连接的服务器平台使用的是公网和还是专网，如果是专网需配置正确APN。\n3、需要网络无线检测，首先把所有服务器都关了->然后重启数采仪，进入本机信息，选择4G测试，再点击4G检测，等几分钟。\n测试显示结果如下：\ngprs start up okAT+CPIN?\nAT+CPIN?\nOK  或者 +CME ERROR:10  \n\t*显示OK表示手机卡安装正确。\n\t*显示+CME ERROR:10表示手机卡安装有问题，请重新安装。\nAT+CGREG?\nAT+CGREG?\n+CGREG:0,0 \n\t*显示+CGREG:0,0表示未注册到网络，网络连接不正常，需要检查手机卡是否欠费，卡是否被锁定，天线是否正确安装拧紧，天线应放置在空旷无遮挡区域。\n\t*显示+CGREG:0,1表示已注册到网络，网络连接正常。\n\t*显示+CGREG:0,3表示拒绝注册到网络，网络连接不正常，需要检查手机卡是否欠费，卡是否被锁定，或者更换手机卡测试。\nOK\nAT+CSQ\nAT+CSQ\n+CSQ:20,99\n\t*显示+CSQ:20,99表示当前连接网络信号强度为20。信号强值为0-31，信号要求为18以上。信号太弱需要检查天线是否正确安装拧紧，天线应放置在空旷无遮挡区域。\nOK",
                "istitle": true
            },
            {
                "title": "1-2. 平台下发失败或者下发中原因",
                "content": "1、下位机未按照解释说明配置，如IP、端口错误。\n2、站房位置较偏，2G专网卡网速慢。\n3、数采仪接收到平台下发报文，但是解析失败，这个需要联系设备厂家升级。\n4、数采仪不在线或者掉线。\n5、下位门禁机中已有该人员信息，需要删除后再重新下发。\n6、照片模糊，门禁机无法识别。按照解释说明要求规范添加。(门禁对人脸像素有要求)\n7、核对下位配置MN、门禁编号是否和平台一致。\n参考以上失败原因。",
                "istitle": true
            }
        ]
    },
    {
        "title": "2. U盘升级",
        "content": "",
        "istitle": true,
        "subnodes": [
            {
                "title": "2-1. 使用U盘格式要求",
                "content": "格式要求:U盘USB2.0，格式为FAT32",
                "istitle": true
            },
            {
                "title": "2-2. 使用U盘升级步骤",
                "content": "1、把升级包解压出来的acqlib、commlib、ctrlib、firmware、webserver这5个文件放到u盘根目录下面，不要放到u盘其他文件夹内。\n2、数采仪本机信息，点击升级系统进入USB升级界面。\n3、插上U盘后，等待10秒是系统识别到U盘，然后点击下一步，开始升级。\n4、升级完系统后要重启。升级系统后，如需查看当前系统版本，点击详细信息查看升级版本信息。升级完成后，断电5秒后，再点击关机。",
                "istitle": true
            }
        ]
    },
    {
        "title": "3 ONE",
        "content": "3----------------------------",
        "istitle": true
    },
    {
        "title": "4 ONE",
        "content": "4----------------------------",
        "istitle": true,
        "subnodes": [
            {
                "title": "4-1 TWO",
                "content": "4-1----------------------------",
                "istitle": true
            },
            {
                "title": "4-2 TWO",
                "content": "4-2----------------------------",
                "istitle": true
            }
        ]
    },
    {
        "title": "5 ONE",
        "content": "5----------------------------",
        "istitle": true,
        "subnodes": [
            {
                "title": "5-1 TWO",
                "content": "5-1----------------------------",
                "istitle": true
            },
            {
                "title": "5-2 TWO",
                "content": "5-2----------------------------",
                "istitle": true,
                "subnodes": [
                    {
                        "title": "5-2-1 THREE",
                        "content": "5-2-1----------------------------",
                        "isoption": true
                    },
                    {
                        "title": "5-2-2 THREE",
                        "content": "5-2-1----------------------------",
                        "isoption": true
                    }
                ]
            }
        ]
    },
    {
        "title": "一级标题",
        "content": "这是一级标题内容",
        "istitle": true,
        "subnodes": [
            {
                "title": "二级标题",
                "content": "这是二级标题的内容",
                "istitle": true
            },
            {
                "title": "二级标题",
                "content": "这是二级标题的内容",
                "istitle": true,
                "subnodes": [
                    {
                        "title": "三级标题",
                        "content": "这是三级标题的内容"
                    },
                    {
                        "title": "三级标题",
                        "content": "这是三级标题的内容"
                    }
                ]
            }
        ]
    }
]
