```swift
accelerometerGraphView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            accelerometerGraphView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            accelerometerGraphView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            accelerometerGraphView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            accelerometerGraphView.heightAnchor.constraint(equalToConstant: accelerometerGraphView.bounds.width),
            
            gyroGraphView.topAnchor.constraint(equalTo: accelerometerGraphView.topAnchor),
            gyroGraphView.leadingAnchor.constraint(equalTo: accelerometerGraphView.leadingAnchor),
            gyroGraphView.trailingAnchor.constraint(equalTo: accelerometerGraphView.trailingAnchor),
            gyroGraphView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            gyroGraphView.heightAnchor.constraint(equalToConstant: gyroGraphView.bounds.width)
```





```swift
  import CoreMotion  
var manager = CMMotionManager()
private func acceleration() {
        manager.accelerometerUpdateInterval = 0.1
        
        manager.startAccelerometerUpdates(to: .main) { (data, error) in
        }
    }
    
    private func gyro() {
        manager.gyroUpdateInterval = 0.1
        
        manager.startGyroUpdates(to: .main) { (data, error) in
        }
    }
```





CAShapeLayer

이미지 기반 컨텐츠를 관리하고, 해당 컨텐츠에서 애니메이션을 수행할 수 있는 객체

좌표공간에 cubic Bezier spline을 그리는 레이어