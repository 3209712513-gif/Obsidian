"""
功能：吃水线检测 -
作者：
日期：{{date}}
依赖：opencv-python, numpy, matplotlib
"""

import cv2
import numpy as np
import matplotlib.pyplot as plt


def load_image(path):
    """加载图像并转为 RGB"""
    img = cv2.imread(path)
    return cv2.cvtColor(img, cv2.COLOR_BGR2RGB)


def preprocess(img):
    """预处理：去噪、增强等"""
    # 中值滤波
    denoised = cv2.medianBlur(img, 5)
    return denoised


def segment_hull(img):
    """HSV 颜色分割提取船体"""
    hsv = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
    # 红色船体阈值
    lower_red = np.array([0, 80, 80])
    upper_red = np.array([10, 255, 255])
    mask = cv2.inRange(hsv, lower_red, upper_red)
    return mask


def find_waterline(mask):
    """逐列扫描找吃水线"""
    # TODO: 实现吃水线检测逻辑
    pass


def smooth_waterline(points, window=30):
    """中位数平滑"""
    # TODO: 实现平滑逻辑
    pass


if __name__ == "__main__":
    # 测试
    img = load_image("test.jpg")
    mask = segment_hull(img)
    waterline = find_waterline(mask)
    print("检测完成")
