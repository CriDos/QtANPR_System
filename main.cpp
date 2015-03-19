#include <QCoreApplication>
#include "image.h"

int main(int argc, char* argv[])
{
    QCoreApplication a(argc, argv);

    Image alpr;

    cv::Mat img = cv::imread("test.jpg", 1);

    alpr.recognize(img);
    alpr.saveFrames();
    alpr.showSymbol();

    for (auto& x : alpr.getLicenseText())
        std::cout << x << std::endl;

    cv::waitKey(0);

    return a.exec();
}
