package sutdaGame.web.util;

import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

public class DownloadTimer {
	public static ArrayList<Long> downloadIpList = new ArrayList<Long>();
	public static long userNumber=1;
	private TimerTask tt;
	private int i=60;
	
	public DownloadTimer() {
		System.out.println("D");
		Timer t = new Timer();
	    tt = new TimerTask() {
	    	
	    	@Override
			 public void run() {
				if(i > 0) {
				 	i--;
				} else {
					downloadIpList.clear();
					i=60;
				}
			}
		};
		  
	    t.schedule(tt,0,1000);
	}
	
} //DownloadTimer();
