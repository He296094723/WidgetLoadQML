#include "mainwindow.h"
#include "ui_mainwindow.h"
//#include<QQuickw>
#include<QQuickItem>
#include<QtDebug>
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
//    this->setAttribute(Qt::WA_TranslucentBackground, true);
    for(int i=0;i<10;i++)
    qDebug()<<  QString("%2,%1").arg(i).arg(i*2);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
//        ui->quickWidget->setAttribute(Qt::WA_AlwaysStackOnTop);
//        ui->quickWidget->setClearColor(QColor(Qt::transparent));
        ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
        ui->quickWidget->rootObject()->setWidth(1131);
        ui->quickWidget->rootObject()->setHeight(586);
//        ui->quickWidget->move(this->width()/2.0 - ui->quickWidget->width()/2.0,342);
//        ui->quickWidget->show();
}
