import QtQuick 2.11
import QtQuick.Window 2.11
import "./pinyinjs/pinyinUtil.js" as PinyinUtil

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML pinyin")

    Column  {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        Row {
            spacing: 10
            Text {
                text: '长城和长大'
            }
            Text {
                id: a
            }
        }

        Row {
            spacing: 10
            Text {
                text: '输出'
            }
            Text {
                id: b
            }
        }
        Row {
            spacing: 10
            Text {
                text: '伟大的大夫'
            }
            Text {
                id: c
            }
        }
        Row {
            spacing: 10
            Text {
                text: '周杰伦'
            }
            Text {
                id: d
            }
        }
    }



    Rectangle{
        anchors.bottom:  parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 100
        height: 100
        color: "blue"
        Text {
            text: '转换pinyin'
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                a.text = PinyinUtil.pinyinUtil.getFirstLetter('长城和长大'); // 输出：cháng chéng hé zhǎng dà
                b.text = PinyinUtil.pinyinUtil.getPinyin('输出', ' ', false, false) // 输出：hē shuǐ hé hè cǎi
                c.text = PinyinUtil.pinyinUtil.getPinyin('伟大的大夫', ' ', false, false) // 输出：wěi dà de dài fū
                d.text = PinyinUtil.pinyinUtil.getFirstLetter('周杰伦')
            }
        }
    }

    Component.onCompleted: {
        PinyinUtil.pinyinUtil.parseDict()
    }
}
