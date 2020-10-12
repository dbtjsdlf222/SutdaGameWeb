package sutdaGame.web.vo;

public class Page {

	private int total;		//총 몇개 게시물
	private int contentCount;
	private int pageCount;	//몇개를 출력할지
	private int start;		//시작
	private int current;	//현재 페이지
	private int end;		//
	private boolean next;	//다음 값이 있는지
	
	public Page(int total, int contentCount, int pageCount, int current) {
		
		this(contentCount, pageCount, current);
		initTotal(total);
		
	} //Page();
	
	public Page(int contentCount, int pageCount, int current) {
		
		this.contentCount = contentCount;
		this.pageCount = pageCount;
		this.current = current;
		this.start = this.current - ((this.current - 1) % this.pageCount);
		
	} //Page();
	
	public Page initTotal(int total) {
		
		this.total = (total + (this.contentCount - 1)) / this.contentCount;
		this.end = Math.min(this.start + this.pageCount - 1, this.total);
		this.next = this.end < this.total;
		
		return this;
		
	} //initTotal();
	
	public int getTotal() { return total; }
	public int getContentCount() { return contentCount; }
	public int getPageCount() { return pageCount; }
	public int getStart() { return start; }
	public int getStartContent() { return (current - 1) * contentCount; }
	public int getCurrent() { return current; }
	public int getEnd() { return end; }
	public boolean isNext() { return next; }
	public void setTotal(int total) { this.total = total; }
	public void setContentCount(int contentCount) { this.contentCount = contentCount; }
	public void setPageCount(int pageCount) { this.pageCount = pageCount; }
	public void setStart(int start) { this.start = start; }
	public void setCurrent(int current) { this.current = current; }
	public void setEnd(int end) { this.end = end; }
	public void setNext(boolean next) { this.next = next; }
	
	@Override
	public String toString() {
		return "Page [total=" + total + ", contentCount=" + contentCount + ", pageCount=" + pageCount + ", start="
				+ start + ", current=" + current + ", end=" + end + ", next=" + next + "]";
	} //toString();
	
} //class Page;
