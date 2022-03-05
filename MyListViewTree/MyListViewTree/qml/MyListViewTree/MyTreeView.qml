import QtQuick 2.0

Rectangle{
    id:myTreeViewRect

    property int currentItem: -1 //当前选中item

    property int spacing: 20    //项之间距离
    property int indent: 15      //子项缩进距离,注意实际还有icon的距离
//    property string onSrc: "qrc:/img/on.png"
//    property string offSrc: "qrc:/img/off.png"
//    property string checkedSrc: "qrc:/img/check.png"
//    property string uncheckSrc: "qrc:/img/uncheck.png"

    property var checkedArray: [] //当前已勾选的items
    property bool autoExpand: true
    property bool mouseArea: false
    property bool btn_expand_click:false
    //背景
    // color: "transparent"//"lightgray"
    //color: Qt.rgba(2/255,19/255,23/255,128/255)
   // border.color: "darkCyan"
    property alias model: list_view.model
    property var rootModelB:list_view.model
    property var jsonObjArray:[]
    property var jsonObjArrayA:[]
    MouseArea {
        id: control_mousearea
        z:1
        anchors.fill: parent
        visible: myTreeViewRect.mouseArea
        onClicked: {
            commonShowTipsId.visible=false;
            myTreeViewRect.mouseArea=false;
        }
    }
    ListView{
        //contentWidth: 500
        //flickableDirection: Flickable.AutoFlickIfNeeded
        id: list_view
        anchors.fill: parent
        anchors.margins: 10
        //通过+1来给每个item一个唯一的index
        //可以配合root的currentItem来做高亮
        property int itemCount: 0
        //model: //model由外部设置，通过解析json
        delegate: list_delegate
        clip: true
        onModelChanged: {
            console.log(".....onModelChanged..........")
            itemCount=0;
            checkedArray=[]; //model切换的时候把之前的选中列表清空
        }
        focus: true
//        Rectangle{
//            anchors.fill: parent
//            color:"transparent"
//            opacity:0.88
//            border.width: 1
//            radius: 7
//        }
    }

    Component{
        id:list_delegate
        Row{
            id:list_itemgroup
            spacing: 10

            //项内容：包含一行item和子项的listview

            Column{
                id:list_itemcol

                //这一项的内容，这里只加了一个text
                Row {
                    id:list_itemrow
                    width: myTreeViewRect.width
                    height: item_text.contentHeight+myTreeViewRect.spacing
                    spacing: 5

                    property int itemIndex:0
                    property int changeColor:0

                    Rectangle{
                        id:rect
                        height: item_text.contentHeight+myTreeViewRect.spacing
                        width: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        color: ((currentItem ===list_itemrow.itemIndex))
                               ?Qt.rgba(101/255,255/255,255/255,38/255)
                               :"transparent"

                        Text {
                            id:item_text
                            z:1
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData.title
                            font.pixelSize: 16
                            //font.family: "Microsoft YaHei UI"
                            //color: Qt.rgba(101/255,1,1,1)
                        }

                        Rectangle{
                            height: item_text.contentHeight+myTreeViewRect.spacing-1
                            width: modelData.subnodes===undefined?myTreeViewRect.width-20-indent:myTreeViewRect.width-20
                            color:modelData.subnodes===undefined?"#ffffff":"#d7e4ed"
                            //color:"transparent"
                            opacity:0.88
                            border.width: 1
                            radius: 7
                        }

                        MouseArea{
                            id:mouseArea1
                            anchors.fill: parent
                            enabled: true
                            onClicked: {
                                currentItem=list_itemrow.itemIndex;
                                console.log("Be selected with modelData.subnodes:",modelData.subnodes)

                                if(modelData.subnodes === undefined){
                                    console.log("Does not exist modelData.subnodes Object")

                                    commonShowTipsId.visible=true;
                                    //commonShowTipsId.chooseTipsFun=NULL;
                                    //commonShowTipsId.pageSelect=1;//goto serial config page
                                    commonShowTipsId.contentInfo= modelData.content
                                    myTreeViewRect.mouseArea=true;

                                    //commonShowTipsId.skipLabel="点击取消";

                                }else{
                                    item_sub.visible=!item_sub.visible; // item_sub extension unfold or fold
                                    commonShowTipsId.visible=false;
                                    console.log(" modelData...",rootModel.istitle,list_itemrow.itemIndex,modelData.istitle,rootModelB)
                                }
                                 console.log("The selected itemIndex is ",list_itemrow.itemIndex)
                            }
                        }
                    }
                    Component.onCompleted: {
                        list_itemrow.itemIndex=list_view.itemCount;
                        list_view.itemCount+=1;
                        console.log("......list_view.itemCount"+list_view.itemCount )
                    }
                }//end list_itemrow


               //放子项,二级树（二级目录）
                Column{
                    id:item_sub
                    visible: myTreeViewRect.autoExpand
                    //上级左侧距离=小图标宽+x偏移
                    x:indent

                    Item {
                        width: 10
                        height: item_repeater.contentHeight

                        //需要加个item来撑开，如果用Repeator获取不到count
                        ListView{
                            id:item_repeater
                            anchors.fill: parent
                            delegate: list_delegate
                            model:modelData.subnodes
                        }
                    }
                }

                Component.onCompleted: {
                    //jsonObjArray.pop("");
                    jsonObjArray.push(modelData);
                    console.log("..........."+jsonObjArray)
                    listArrayReverse(jsonObjArray)
                 }
            }
        } //end list_itemgroup
    }
    //end list_delegate

    function listArrayReverse (listArray){
        var j=0;
        for (var i= listArray.length-1;i>=0;i--){
            jsonObjArray[j++]=listArray[i];
            //console.log("listArrayReverse"+jsonObjArray[i],jsonObjArray[0].title);
        }
        jsonObj(jsonObjArray)
    }


    function jsonObj(listArray){
        for(var i in listArray){
            if(listArray[i].istitle===true)
              console.log(i,listArray[i].title)  //一级
            else{
                console.log("二级"+i,listArray[i].title)  //二级
            }
        }
    }


/*
定义数组
property var strArray:[]
添加元素
strArray.push("first");
删除元素
strArray.pop();
清空数组
strArray = [];//或者strArray.length = 0;
*/

    //勾选时放入arr中
    function check(index){
        checkedArray.push(index);
    }

    //取消勾选时从arr移除
    function uncheck(index){
        var i = checkedArray.length;

        while (i--) {
            if (checkedArray[i] === index) {
                checkedArray.splice(i,1);
                break;
            }
        }
    }
}
