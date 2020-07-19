/*
 * Copyright (C) 2020  Czarek Nakamoto
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * clicker is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'clicker.mrcyjanek'
    automaticOrientation: true

    property var doge: 0

    width: units.gu(45)
    height: units.gu(75)

    Page {
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
                doge++;
            }
        }
        Label {
            id: dogeamt
            anchors.top: clickbtn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: doge + ' ' + i18n.tr('Dogecoin')
        }
    }
}
