//
//  ViewController.swift
//  DispatchAndOperations
//
//  Created by Hossam on 28/02/2021.
//

import UIKit

//1- Run Code ASYNC , Serialized or Concurrent
//2- Run Code SYNC , serialezed or concurrent
/*
 async this will not block the thread and returns immediatly
 sync will wait and block the thread to finish and then returns
 
 async + serialized = returns immendiatly and uses one thread
 async + concurrent = returns immediatly and uses multi thread
 
 sync + serialized = returns after finishs task and uses One thread
 sync + concurrent = returns after finishs task and use Muli Thread
 */
class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        willChangeValue(forKey: "x")
        
//        example(of: "ASYNC + SERIALIZED_Q") {
//            /*
//             all ASYNC Closures will return immediatly
//             but the tasks will schaduled in the Queue and will use  only 1 thread on all tasks  so It will be like QUEUE in order too
//
//             */
//            let que = DispatchQueue(label: "Custome" , attributes: [])
//            que.async {
//                sleep(1)
//                print(Thread.current , "1")
//
//            }
//            que.async {
//                sleep(4)
//                print(Thread.current , "2")
//
//            }
//            que.async {
//                sleep(1)
//                print(Thread.current , "3")
//
//            }
//
//            print("AFter Queue")
//        }
        
//        example(of: "ASYNC + concurrent_Q") {
//            /*
//             all ASYNC Closures will return immediatly
//             but the tasks will schaduled in the Queue and will use DIFFERENT THREADS so all tasks will works in same time but in different threads ,
//             when tasks finishes it returns so order of adding the task don't matter , what matter is the Duration to complete the task and the returns
//
//             */
//            let que = DispatchQueue(label: "Custome" , attributes: .initiallyInactive)
//
//            que.async {
//                sleep(1)
//                print(Thread.current , "1")
//
//            }
//            que.async {
//                sleep(4)
//                print(Thread.current , "2")
//
//            }
//            que.async {
//                sleep(1)
//                print(Thread.current , "3")
//
//            }
//            que.activate()
//            print("AFter Queue")
//        }

        
//                example(of: "ASYNC + SERIALIZED_Q") {
//                    /*
//                     all SYNC Closures will return After it's Taks Complete , and this will block the current Thread
//                     but the tasks will schaduled in the Queue and will use  only 1 thread on all tasks  so It will be like QUEUE in order too
//
//                     */
//                    let que = DispatchQueue(label: "Custome" , attributes: [])
//                    que.sync {
//                        sleep(1)
//                        print(Thread.current , "1")
//
//                    }
//                    que.sync {
//                        sleep(4)
//                        print(Thread.current , "2")
//
//                    }
//
//                    que.sync {
//                        sleep(1)
//                        print(Thread.current , "3")
//
//                    }
//                    print("AFter Queue")
//                }
                
//                example(of: "ASYNC + concurrent_Q") {
//                    /*
//                     all SYNC Closures will return After it's Taks Complete , and this will block the current Thread
//                   Each task well wait block the current thread until it complete after that the next task will add and it will block current thread too , and so one
//                     ******* NOT SURE
//                     */
//                    let que = DispatchQueue(label: "Custome" , attributes: .concurrent)
//                    que.sync {
//                        sleep(1)
//                        print(Thread.current , "1")
//
//                    }
//                    que.sync {
//                        sleep(4)
//                        print(Thread.current , "2")
//
//                    }
//                    que.sync {
//                        sleep(1)
//                        print(Thread.current , "3")
//
//                    }
//
//                    print("AFter Queue")
//                }
//
        
        
        
        
        
        
        
        
        
        
        
        
//        example(of: "WorkItem") {
//            let workItem = DispatchWorkItem {
//                print(Thread.current)
//                sleep(10)
//                print("Finished")
//            }
//
//            let workItemToWait = DispatchWorkItem(flags:.barrier) {
//                print(Thread.current)
//                sleep(3)
//                print("Finished Barriere")
//            }
//
//            DispatchQueue.global().async(execute: workItem)
//            DispatchQueue.global().async(execute: workItem)
//            DispatchQueue.global().async(execute: workItemToWait)
//            workItem.notify(queue: .main) {
//                print("Finished55")
//            }
//
//
//
//        }
//
        
        
//        example(of: "Sync->T") {
//          let result =   DispatchQueue.global().sync { () -> String in
//                sleep(2)
//                return "I Just Finished"
//            }
//            print(result)
//        }
    
        
        //TRY TO STOP UI INTERACTION EVERY 0.5 SEC
//        let indicator = UIScrollView()
//        indicator.contentSize = .init(width: 3000, height: 3000)
//        indicator.frame = view.frame
//        self.view.addSubview(indicator)
//
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (_) in
//            DispatchQueue.global().sync {
//                sleep(2)
//            }
//        }
        
        
        
        
//
//        example(of: "Example For DispatchGroup") {
            
            
            /*Used to add tasks to this group and get notified after the group did excutes all its tasks ,
             if you have tasks that include ASYNC function so when you run this ASYNC Task it will returns immediatly , the
             way you can fix that is before entering the ASYNC Method group.enter() , before ASYNC method finishes write group.leave()
             to let group this function has done ,
             
             if you WAIT() this will block current thread until Group finishes its tasks
             
            */
//            let group = DispatchGroup()
//
//
//            DispatchQueue.global().async(group: group, execute: {
//                sleep(2)
//                print("1")
//                group.enter()
//                DispatchQueue.global().async {
//                    sleep(10)
//                    print("Enter Nested")
//                    group.leave()
//                }
//
//            })
//
//            DispatchQueue.global().async(group: group, execute: {
//                sleep(2)
//                print("2")
//
//            })
//
//            DispatchQueue.global().async(group: group, execute: {
//                sleep(2)
//                print("3")
//
//            })
//
//            DispatchQueue.global().async(group: group, execute: {
//
//                DispatchQueue.global().async {
//                    sleep(2)
//                    print("4")
//                }
//
//            })
//            group.notify(queue: .main) {
//                print("Finished")
//            }
//            group.wait()
//            print("After Finish BEO MA")
//        }
        
        
        
        /*
         it works like groups , but instead , you make a normal tasks , after that on start of each task call wait() , after it finishes call signal()
         the value in Semaphone is the linit tasks that run concurrenlty
         https://medium.com/@roykronenfeld/semaphores-in-swift-e296ea80f860
         
         */
        let semaphore = DispatchSemaphore(value: 2)
        let queue = DispatchQueue.global()
        queue.async {
            semaphore.wait()
            print("1 Started")
            
            sleep(3)
            print("1 Finished")
            semaphore.signal()

        }
        queue.async {
            semaphore.wait()
            print("2 Started")
            sleep(3)
            print("2 Finished")
            semaphore.signal()
        }
        queue.async {
            semaphore.wait()
            print("3 Started")
            sleep(3)
            print("3 Finished")
            semaphore.signal()
        }
        queue.async {
            semaphore.wait()
            print("4 Started")
            sleep(3)
            print("4 Finished")
            semaphore.signal()
        }
        
        
    }
        
    
 
    
    private func testConcurrence(threadCount: Int) {
         
         DispatchQueue.concurrentPerform(iterations: threadCount, execute: { index in
             print("started index=\(index) thread=\(Thread.current)")
             let currentThread = Thread.current
             DispatchQueue.global().async {
                 // Download an image in a serial manner.
                 let url = URL(string: "https://taoren.me/2018/01/16/image_0.png")
                 let _ = try? Data(contentsOf: url!)
                 print("global().async index=\(index), from thread=\(currentThread), thread=\(Thread.current)")
             }
             print("ended \(index)")
         })
         print("testConcurrence end thread=\(Thread.current)")
     }
        
        
        
    public func example(of description: String,
                        action: () -> Void) {
      print("\n——— Example of:", description, "———")
      action()
    }

    
    var x : String = "0" {
        willSet{
            print("New Value")
        }
        didSet {
            print("OldValue")
        }
    }



}


