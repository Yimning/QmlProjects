import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import '../MyListViewTree/jsonscripts/readJson.js' as Json
import QReadJson.module 1.0

Rectangle {
    id: root
        visible: true
        width: 640
        height: 300
       // title: qsTr("QmlTreeView Test By Yimning")
        //color: Qt.rgba(3/255,26/255,35/255,1)
        property var rootModel:[]
        signal changeModelData
        property string jsonString:""
        //滚动条可以自己设置
        //ListView横向滚动条需要设置如下两个参数(如果是竖向的ListView)
       // contentWidth: 500
        //flickableDirection: Flickable.AutoFlickIfNeeded
        function init()  //初始化模型数据
        {
           jsonString = qReadJson.readJson("./qml/MyListViewTree/jsonFiles/jsonString.json");
           jsonString = jsonString.toString().trim();
           item_tree.model=JSON.parse(jsonString);

        }
        function printJsonObject(obj) //打印/修改对象的某个属性的值
        {
            for (var key in obj) {
                if (obj[key] instanceof Object) {
                    printJsonObject(obj[key]);
                    obj.istitle=false;
                } else {
                    //console.log(key+":"+obj[key]);
                    obj.istitle=false;
                };
            }
        }
        onChangeModelData: {
            replaceItem();
        }

        function replaceItem()//替换模型数据
        {
            root.rootModel=item_tree.model
            // 调用 printJsonObject() 函数
            printJsonObject(root.rootModel);

            item_tree.model=root.rootModel  //替换模型数据
        }

        CommonShowTips{
            id:commonShowTipsId
            x: 151//243
            y: 80//56
            z:3
            visible:false
            //onMouselimitAppear: mouselimit.visible=true
            //onMouselimitDisappear: mouselimit.visible=false
            anchors.horizontalCenter: parent.horizontalCenter
        }

        QReadJsonLib{
            id:qReadJson
        }
        MyTreeView{
            id: item_tree
            width: parent.width
            anchors{
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                margins: 10
            }
            model: rootModel

            //set model data
            Component.onCompleted: {
                //jsonString = qReadJson.readJson("qml/hello/jsonFiles/jsonString.json");
               // console.log("qReadJson.readJson()............"+qReadJson.readJson("./qml/hello/jsonString.json"))

               //root.setTestDataA();  //CAN NOT RUN this slot function ???
               // root.setTestDataB();
                root.init();
            }
        }

        Column{
            anchors{
                right: parent.right
                top: parent.top
                margins: 10
            }
            spacing: 10
//            Button{
//                text: "ChangeModel"
//                checkable: true
//                //changed model data
//                onCheckedChanged: {
//                    if(checked){
//                        root.setTestDataB();
//                    }else{
//                        root.setTestDataA();
//                    }
//                }
//            }



            Button{
                id:btn_expand
                text:"关闭扩展"
                checkable: true
                //changed model data
                onCheckedChanged: {
                   //item_tree.btn_expand_click = true

                        //item_tree.autoExpand=!item_tree.autoExpand
                        item_tree.autoExpand=!item_tree.autoExpand
                        //root.init();
                        btn_expand.text =(btn_expand.text=="关闭扩展")?"扩展全部":"关闭扩展"
                        commonShowTipsId.visible=false;
                        item_tree.mouseArea=false;
                    if(btn_expand.text=="关闭扩展"){
                            init();
                    }else{
                        replaceItem();
                        //changeModelData();
                        var x
                        for (x in item_tree.rootModelB)  // x 为属性名
                        {
                            console.log("rootModelB===",x,item_tree.rootModelB[x]);
                        }
                    }
                }

            }
        }

        function setTestDataA(){
            console.log("..........setTestDataA..........")
            root.rootModel=JSON.parse('[
                    {
                        "text":"1 ONE",
                        "istitle":true,
                        "subnodes":[
                            {
                                "text":"1-1 TWO",
                                "istitle":true,
                                "subnodes":[
                                    {"text":"1-1-1 THREE","isoption":true},
                                    {"text":"1-1-2 THREE","isoption":true}
                                ]
                            },
                            {
                                "text":"1-2 TWO",
                                "istitle":true,
                                "subnodes":[
                                    {"text":"1-2-1 THREE","isoption":true},
                                    {"text":"1-2-2 THREE","isoption":true}
                                ]
                            }
                        ]
                    },
                    {
                        "text":"2 ONE",
                        "istitle":true,
                        "subnodes":[
                            {"text":"2-1 TWO","istitle":true},
                            {
                                "text":"2-2 TWO",
                                "istitle":true,
                                "subnodes":[
                                    {"text":"2-2-1 THREE","isoption":true},
                                    {"text":"2-2-2 THREE","isoption":true}
                                ]
                            }
                        ]
                    },
                    {"text":"3 ONE","istitle":true},
                    {
                        "text":"4 ONE",
                        "istitle":true,
                        "subnodes":[
                            {"text":"4-1 TWO","istitle":true},
                            {"text":"4-2 TWO","istitle":true}
                        ]
                    }
                ]')
        }

        function setTestDataB(){
            console.log("..........setTestDataB..........")
        }

        states: [
            State {
                name: "shrink";when:clkeyboard.visible===false
            }
        ]
}
