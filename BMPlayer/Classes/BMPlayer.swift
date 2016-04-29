//
//  BMPlayer.swift
//  Pods
//
//  Created by BrikerMan on 16/4/28.
//
//

import UIKit
import SnapKit

enum BMPlayerState {
    case NotSetURL      // 未设置URL
    case MediaInfoReady // 获取媒体信息
    case Buffering      // 缓冲中
    case BufferFinished // 播放中
    case ReadyToPlay    // 播放中
    case Playing        // 播放中
    case Stopped        // 停止播放
    case Pause          // 暂停播放
    case PlayedToTheEnd // 
    case Error
}


public class BMPlayer: UIView {
    
    var playerLayer: BMPlayerLayerView!
    
    public func playWithURL(url: NSURL) {
        playerLayer = BMPlayerLayerView()
        insertSubview(playerLayer, atIndex: 0)
        playerLayer.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        playerLayer.delegate = self
        playerLayer.videoURL = url
        self.layoutIfNeeded()
    }
    
    public func play() {
        playerLayer.play()
    }
    
    public func pause() {
        playerLayer.pause()
    }
    
    deinit {
        playerLayer.pause()
        playerLayer.prepareToDeinit()
    }
}

extension BMPlayer: BMPlayerLayerViewDelegate {

    func bmPlayer(player player: BMPlayerLayerView ,loadedTimeDidChange  loadedDuration: Int , totalDuration: Int) {
        print("loadedTimeDidChange - \(loadedDuration) - \(totalDuration)")
    }
    
    func bmPlayer(player player: BMPlayerLayerView, playerStateDidChange state: BMPlayerState) {
        print("playerStateDidChange - \(state)")
    }
    
    func bmPlayer(player player: BMPlayerLayerView, playTimeDidChange currentTime: Int, totalTime: Int) {
        print("playTimeDidChange - \(currentTime) - \(totalTime)")
    }
}