package sutdaGame.web.util;

import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

public class LimitTimer {
	public static Map<Long,Boolean> downloadList = new ConcurrentHashMap<Long,Boolean>();
	public static Map<Integer, Integer> commentMap = new ConcurrentHashMap<Integer, Integer>();
	public static Map<Integer, Integer> boardList = new ConcurrentHashMap<Integer,Integer>();
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
					downloadList = new ConcurrentHashMap<Long,Boolean>();
					commentMap = new ConcurrentHashMap<Integer, Integer>();
					boardList = new ConcurrentHashMap<Integer,Integer>();
					i = 60;
				}
			}
		};
		t.schedule(tt, 0, 1000);
	}

} // DownloadTimer();
