package shop;

import java.util.Hashtable;

//��ٱ���: DB���� �ƴϰ� ���� ����
public class CartMgr {

	// key: ��ǰ��ȣ,value: �ֹ���ü
	private Hashtable<Integer/* ��ǰ��ȣ */, OrderBean> hCart = new Hashtable<Integer, OrderBean>();

	// Cart Add
	public void addCart(OrderBean order) {
		int productNo /* key��:��ǰ��ȣ */ = order.getProductNo();
		int quantity/* �ֹ����� */ = order.getQuantity();
		if (quantity > 0) {
			// ������ hCart�� ��ǰ�� �ִ��� ������ �˻�
			if (hCart.containsKey(productNo)) {
				// ������ ����
				// ������ ����� �ֹ���ü�� �����´�.
				OrderBean temp = hCart.get(productNo);
				//������ ������ ���ο� �ֹ��� ������ ���Ѵ�.
				quantity+=temp.getQuantity();
				//������ ������ �ֹ���ü�� setter �ϰ�
				order.setQuantity(quantity);
				//������ ������ �ֹ���ü�� hCart�� ����
				hCart.put(productNo, order); //put:������ �����Ϳ� �����
			} else {
				//����
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
