package edu.housesearcher.crawler.client;

import java.io.Serializable;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import edu.housesearcher.crawler.threadcontroller.ThreadController;

public class MultiThreadTest implements Runnable,Serializable {
    
    private Lock lock = new ReentrantLock();
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;



    public static void main(String[] args){
	ThreadController controller = new ThreadController(new MultiThreadTest(), 5);
	controller.runThreads();
    }
    
    
    
    public synchronized void sleep(){
	

	    Long threadId = Thread.currentThread().getId();
	    if(threadId%2==0){	    
		System.out.println("我是偶数线程，我先睡5秒zzzzz");
		try {
		    Thread.sleep(5000);
		    System.out.println("休息完了");
		} catch (InterruptedException e) {
		    e.printStackTrace();
		}
	    }else{
		System.out.println("奇数线程！");
	    }
	    System.out.println("Hello");
	
    }

    @Override
    public void run() {
	sleep();
    }
}
