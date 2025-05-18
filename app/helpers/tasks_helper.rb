module TasksHelper
  def category_color_class(category)
    solid_classes = [
      # สีพื้นสวยๆ 4 เฉด
      "bg-[#99D2FE] text-[#99D2FE] ",  # ฟ้าใส
      "bg-[#9AA4FE] text-[#9AA4FE] ",  # ม่วงครามอ่อน
      "bg-[#C99BFB] text-[#C99BFB] ",  # ม่วงพาสเทล
      "bg-[#F599DE] text-[#F599DE] "   # ชมพูพีช
    ]

    index = category.to_s.sum % solid_classes.length
    solid_classes[index]
  end
end
