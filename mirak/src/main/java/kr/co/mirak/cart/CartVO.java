package kr.co.mirak.cart;

public class CartVO {
   
   private int cartId;
   private String mem_id;
   
   private String name;
   private String day;
   private int price;
   private int count;
   
   public int getCartId() {
      return cartId;
   }

   public void setCartId(int cartId) {
      this.cartId = cartId;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getDay() {
      return day;
   }

   public void setDay(String day) {
      this.day = day;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public int getCount() {
      return count;
   }

   public void setCount(int count) {
      this.count = count;
   }

   @Override
   public String toString() {
      return "CartVO [cartId=" + cartId + ", mem_id=" + mem_id + ", name=" + name + ", day=" + day + ", price="
            + price + ", count=" + count + "]";
   }
   
}