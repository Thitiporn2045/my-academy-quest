module TasksHelper
  def category_color_class(category)
    # Gradient glow colors that look good with a soft bluish-white background
    gradient_classes = [
      "from-pink-400 to-pink-300 text-white shadow-pink-200",
      "from-purple-500 to-indigo-400 text-white shadow-purple-200",
      "from-yellow-400 to-orange-300 text-white shadow-yellow-100",
      "from-sky-400 to-blue-300 text-white shadow-blue-200",
      "from-emerald-400 to-green-300 text-white shadow-green-200",
      "from-rose-400 to-red-300 text-white shadow-rose-200",
      "from-fuchsia-400 to-pink-300 text-white shadow-fuchsia-200",
      "from-violet-400 to-indigo-300 text-white shadow-violet-200"
    ]

    index = category.to_s.sum % gradient_classes.length
    # Return full gradient class for tailwind
    "bg-gradient-to-r #{gradient_classes[index]} drop-shadow-md"
  end
end
