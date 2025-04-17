package co.yedam.vo;

public class CategoryVO {

    private String categoryCode;       
    private String categoryName;       
    private String subcategoryName;    

    // 기본 생성자
    public CategoryVO() {}

    // 전체 필드를 사용하는 생성자
    public CategoryVO(String categoryCode, String categoryName, String subcategoryName) {
        this.categoryCode = categoryCode;
        this.categoryName = categoryName;
        this.subcategoryName = subcategoryName;
    }

    // Getter / Setter
    public String getCategoryCode() {
        return categoryCode;
    }
    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }
    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    @Override
    public String toString() {
        return "CategoryVO [categoryCode=" + categoryCode + ", categoryName=" + categoryName + ", subcategoryName=" + subcategoryName + "]";
    }
}
