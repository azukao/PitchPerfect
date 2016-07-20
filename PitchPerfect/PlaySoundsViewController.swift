//
//  playSoundsViewController.swift
//  PitchPerfect
//
//  Created by Azuka Omesiete on 6/30/16.
//  Copyright © 2016 Azuka Omesiete. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("Play sound for Button Pressed")
        switch (ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonnPRressed(Sender: UIButton) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        SnailButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        ChipmunkButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        EchoButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        ReverbButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        RabbitButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        DarthVaderButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        StopButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
         
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

}
