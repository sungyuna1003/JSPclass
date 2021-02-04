package shop;

import java.util.Hashtable;

//장바구니: DB연동 아니고 세션 연동
public class CartMgr {

	// key: 상품번호,value: 주문객체
	private Hashtable<Integer/* 상품번호 */, OrderBean> hCart = new Hashtable<Integer, OrderBean>();

	// Cart Add
	public void addCart(OrderBean order) {
		int productNo /* key값:상품번호 */ = order.getProductNo();
		int quantity/* 주문수량 */ = order.getQuantity();
		if (quantity > 0) {
			// 기존에 hCart에 상품이 있는지 없는지 검사
			if (hCart.containsKey(productNo)) {
				// 기존에 있음
				// 기존에 저장된 주문객체를 가져온다.
				OrderBean temp = hCart.get(productNo);
				//기존의 수량과 새로운 주문의 수량을 더한다.
				quantity+=temp.getQuantity();
				//증가된 수량을 주문객체에 setter 하고
				order.setQuantity(quantity);
				//수량이 증가된 주문객체를 hCart에 저장
				hCart.put(productNo, order); //put:기존에 있은것에 덮어쓰기
			} else {
				//없음
				hCart.put(productNo, order);
			}
		}
	}

	// Cart Update
	public void updateCart(OrderBean order) {
		hCart.put(order.getProductNo(), order);
	}

	// Cart Delete
	public void deleteCart(OrderBean order) {
		hCart.remove(order.getProductNo());
	}

	// Cart List
	public Hashtable<Integer, OrderBean> getCartList() {
		return hCart;
	}
}
