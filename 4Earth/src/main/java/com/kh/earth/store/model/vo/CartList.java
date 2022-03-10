package com.kh.earth.store.model.vo;

import java.util.ArrayList;
import java.util.List;

public class CartList {
	private List<Cart> cartList = new ArrayList<>();

	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	
}
