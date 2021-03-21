package sutdaGame.web.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

public class LimitTimer {
	public static ArrayList<Long> downloadList = new ArrayList<Long>();
	public static Map<Integer, Integer> commentMap = new ConcurrentHashMap<Integer, Integer>();
	public static ArrayList<Integer> boardList = new ArrayList<Integer>();
	public static long userNumber = 1;
	private TimerTask tt;
	private int i = 60;

	public LimitTimer() {
		Timer t = new Timer();
		tt = new TimerTask() {

			@Override
			public void run() {
				if (i > 0) {
					i--;
				} else {
					downloadList = new ArrayList<Long>();
					commentMap = new HashMap<Integer, Integer>();
					boardList = new ArrayList<Integer>();
					i = 60;
				}
			}
		};
		t.schedule(tt, 0, 1000);
	}

} // DownloadTimer();
