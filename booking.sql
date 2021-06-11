select * from (select rowNum rn, e.* from (select b.bk_no, b.mbd_no, m.mbd_sbjt, b.wkr_id, b.bk_mc_chk, b.bk_chk, b.wkr_reg_no from booking b, 
		mboard m where b.mbd_no=m.mbd_no order by mbd_no desc, bk_no desc) e) 
		where rn between 1 and 10;