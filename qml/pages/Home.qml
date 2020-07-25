import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.0 as Database
import "../scripts/db.js" as DB
import "../scripts/LoadPage.js" as LoadPage

Page {
    id: homeroot
    anchors.fill: parent

    header: PageHeader {
        id: header
        title: i18n.tr('Clicker')
    }

    Button {
        id: clickbtn
        anchors.top: header.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: UbuntuColors.green
        text: i18n.tr('Dig Dogecoins. By hand.')
        width: parent.width*0.75
        onClicked: {
            doge++
        }
    }
    Label {
        id: dogeamt
        anchors.top: clickbtn.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: doge + ' ' + i18n.tr('Dogecoin')
    }

    Button {
        id: openshop
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        color: UbuntuColors.ash
        width: parent.width
        text: i18n.tr('Open Shop')
        onClicked: {
            LoadPage.load('Shop')
        }
    }
}
