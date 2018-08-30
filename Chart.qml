import QtQuick 2.6
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Window 2.0

Item {
    id: chartData
    ChartView {
        id: spline
        title: "水听器采样数据"
        anchors.fill: parent
        width: 1370
        height: 900
        theme: ChartView.ChartThemeBlueCerulean
        backgroundColor: "#000000FF"
        antialiasing: true

        ValueAxis {
            id: axis_X
            min: 0
            max: 150
            tickCount: 11
        }

        ValueAxis {
            id: axis_Y
            min: 0
            max: 100
            tickCount: 16
        }

//        SplineSeries {
//            id: splineSeries
//            name: "X:kHz Y:Power"
//            color: "#00ff00"
//            width: 2
//            axisAngular: axis_X
//            axisRadial: axis_Y

//        }
//        SplineSeries {
//            id: splineSeries1
//            name: "B"
//            color: "#0000ff"
//            width: 2
//            axisAngular: axis_X
//            axisRadial: axis_Y

//        }
        SplineSeries {
            id: splineSeries2
            name: "X:kHz Y:Power"
            color: "#ff0000"
            width: 2
            axisAngular: axis_X
            axisRadial: axis_Y
        }
    }

    property int test : 5;
    property string str : "123456789012345678901234567890";

    Timer{
        id:t
        property string qml_fscode: ""

        interval: 500
        repeat: true
        running: true
        onTriggered:{
            test += 1;
            //

            qml_fscode = serial.fSCode;
            if(qml_fscode)
            {
                var jsonObj = JSON.parse(qml_fscode);
                //console.log(jsonObj["100"]);
                splineSeries2.clear();
                for (var i = 0; i < 249; i++) {
                    splineSeries2.append(i, parseInt(jsonObj[String(i/2)]));
                }
            }


            //splineSeries.append(test,qbSerialitem.axisX)
            //console.debug("this is ");
            //series1.clear();
            //series2.clear();
            // splineSeries.clear();
            //            var num_list;                           //以下为格式转换，分割成可用的数组
            //            //num_list = str.substring(1,str.length-1);
            //            num_list = str.split("");
            //            for (var i = 0; i < str.length; i++) {
            //                // console.log("the num_list is: "+num_list[i].charCodeAt(0)+" ");
            //                splineSeries.append(i,str.charCodeAt(i));
            //            }


            //            for (var i = 0; i <= 100; i++) {
            //                //series1.append(i, Math.random());
            //                series2.append(i, Math.random());
            //                //splineSeries.append(i,Math.random()*10);
            //            }
            //splineSeries.append(test,Number(qbSerialitem.dataStateAck_pitch));
            //splineSeries1.append(test,Number(qbSerialitem.dataStateAck_yaw));
            //splineSeries2.append(test,Number(qbSerialitem.dataStateAck_roll));
            //            splineSeries.append(test,Number(0));
            //            splineSeries1.append(test,Number(0));
            //            splineSeries2.append(test,Number(0));

            //splineSeries2.append(test,Number(joystick.axisZ));
            //            console.log("qbSerialitem.dataStateAck_pitch "+qbSerialitem.dataStateAck_pitch);
            //            console.log("qbSerialitem.dataStateAck_yaw "+qbSerialitem.dataStateAck_yaw);
            //            console.log("qbSerialitem.dataStateAck_roll "+qbSerialitem.dataStateAck_roll);

//            if(test > 300)
//            {
//                                splineSeries.clear();
//                                splineSeries1.clear();
//                                splineSeries2.clear();
//                test  = 0;
//            }
        }
    }
}
