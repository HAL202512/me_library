module TagsHelper

  TAG_COLOR_CONFIGS = {
    # --- 感情 ---
    '喜び・楽しさ' => { base: "bg-yellow-100 text-yellow-800 border-yellow-300 hover:bg-yellow-200", checked: "peer-checked:bg-yellow-400 peer-checked:text-white peer-checked:border-yellow-400" },
    '笑顔・ユーモア' => { base: "bg-amber-100 text-amber-800 border-amber-300 hover:bg-amber-200", checked: "peer-checked:bg-amber-500 peer-checked:text-white peer-checked:border-amber-500" },
    'ワクワク・好奇心' => { base: "bg-orange-100 text-orange-800 border-orange-300 hover:bg-orange-200", checked: "peer-checked:bg-orange-500 peer-checked:text-white peer-checked:border-orange-500" },
    '熱狂・興奮' => { base: "bg-rose-100 text-rose-800 border-rose-300 hover:bg-rose-200", checked: "peer-checked:bg-rose-500 peer-checked:text-white peer-checked:border-rose-500" },
    '勇気・闘志' => { base: "bg-red-100 text-red-800 border-red-300 hover:bg-red-200", checked: "peer-checked:bg-red-500 peer-checked:text-white peer-checked:border-red-500" },
    '安心・安らぎ' => { base: "bg-emerald-100 text-emerald-800 border-emerald-300 hover:bg-emerald-200", checked: "peer-checked:bg-emerald-400 peer-checked:text-white peer-checked:border-emerald-400" },
    '共感・救済' => { base: "bg-teal-100 text-teal-800 border-teal-300 hover:bg-teal-200", checked: "peer-checked:bg-teal-500 peer-checked:text-white peer-checked:border-teal-500" },
    '愛おしさ・感謝' => { base: "bg-pink-100 text-pink-800 border-pink-300 hover:bg-pink-200", checked: "peer-checked:bg-pink-400 peer-checked:text-white peer-checked:border-pink-400" },
    '涙・号泣' => { base: "bg-sky-100 text-sky-800 border-sky-300 hover:bg-sky-200", checked: "peer-checked:bg-sky-500 peer-checked:text-white peer-checked:border-sky-500" },
    '喪失感・ノスタルジー' => { base: "bg-indigo-100 text-indigo-800 border-indigo-300 hover:bg-indigo-200", checked: "peer-checked:bg-indigo-400 peer-checked:text-white peer-checked:border-indigo-400" },
    '感動・発見' => { base: "bg-violet-100 text-violet-800 border-violet-300 hover:bg-violet-200", checked: "peer-checked:bg-violet-500 peer-checked:text-white peer-checked:border-violet-500" },
    '衝撃・圧倒' => { base: "bg-purple-100 text-purple-800 border-purple-300 hover:bg-purple-200", checked: "peer-checked:bg-purple-500 peer-checked:text-white peer-checked:border-purple-500" },
    '迷い・葛藤' => { base: "bg-slate-200 text-slate-800 border-slate-400 hover:bg-slate-300", checked: "peer-checked:bg-slate-600 peer-checked:text-white peer-checked:border-slate-600" }, # 暗めのグレー
    '恐怖・スリル' => { base: "bg-fuchsia-200 text-fuchsia-900 border-fuchsia-400 hover:bg-fuchsia-300", checked: "peer-checked:bg-fuchsia-900 peer-checked:text-white peer-checked:border-fuchsia-900" }, # 紫っぽい黒
    '怒り・反骨' => { base: "bg-red-200 text-red-900 border-red-400 hover:bg-red-300", checked: "peer-checked:bg-red-900 peer-checked:text-white peer-checked:border-red-900" }, # 黒っぽい赤
    
    # --- 価値観 ---
    '挑戦・成長' => { base: "bg-orange-200 text-orange-900 border-orange-400 hover:bg-orange-300", checked: "peer-checked:bg-orange-600 peer-checked:text-white peer-checked:border-orange-600" },
    '努力・継続' => { base: "bg-amber-200 text-amber-900 border-amber-400 hover:bg-amber-300", checked: "peer-checked:bg-amber-600 peer-checked:text-white peer-checked:border-amber-600" },
    '自由・自立' => { base: "bg-sky-200 text-sky-900 border-sky-400 hover:bg-sky-300", checked: "peer-checked:bg-sky-400 peer-checked:text-white peer-checked:border-sky-400" },
    '野心・成功' => { base: "bg-red-200 text-red-900 border-red-400 hover:bg-red-300", checked: "peer-checked:bg-red-600 peer-checked:text-white peer-checked:border-red-600" },
    '情熱・没頭' => { base: "bg-rose-200 text-rose-900 border-rose-400 hover:bg-rose-300", checked: "peer-checked:bg-rose-600 peer-checked:text-white peer-checked:border-rose-600" },
    
    '家族・友情' => { base: "bg-pink-200 text-pink-900 border-pink-400 hover:bg-pink-300", checked: "peer-checked:bg-pink-600 peer-checked:text-white peer-checked:border-pink-600" },
    '愛情・思いやり' => { base: "bg-fuchsia-100 text-fuchsia-800 border-fuchsia-300 hover:bg-fuchsia-200", checked: "peer-checked:bg-fuchsia-500 peer-checked:text-white peer-checked:border-fuchsia-500" },
    '寛容・多様性' => { base: "bg-lime-100 text-lime-800 border-lime-300 hover:bg-lime-200", checked: "peer-checked:bg-lime-500 peer-checked:text-white peer-checked:border-lime-500" }, # 黄緑
    
    '誠実・自分らしさ' => { base: "bg-teal-200 text-teal-900 border-teal-400 hover:bg-teal-300", checked: "peer-checked:bg-teal-700 peer-checked:text-white peer-checked:border-teal-700" },
    '内省・孤独' => { base: "bg-blue-200 text-blue-900 border-blue-400 hover:bg-blue-300", checked: "peer-checked:bg-blue-800 peer-checked:text-white peer-checked:border-blue-800" }, # 深い暗い青
    '美意識・感性' => { base: "bg-cyan-100 text-cyan-800 border-cyan-300 hover:bg-cyan-200", checked: "peer-checked:bg-cyan-400 peer-checked:text-white peer-checked:border-cyan-400" }, # 軽い水色
    '知性・探究心' => { base: "bg-indigo-200 text-indigo-900 border-indigo-400 hover:bg-indigo-300", checked: "peer-checked:bg-indigo-600 peer-checked:text-white peer-checked:border-indigo-600" },
    
    '正義・信念' => { base: "bg-red-100 text-red-900 border-red-300 hover:bg-red-200", checked: "peer-checked:bg-red-700 peer-checked:text-white peer-checked:border-red-700" }, # 情熱の赤
    '貢献・利他' => { base: "bg-emerald-200 text-emerald-900 border-emerald-400 hover:bg-emerald-300", checked: "peer-checked:bg-emerald-700 peer-checked:text-white peer-checked:border-emerald-700" },
    '伝統・文化' => { base: "bg-orange-100 text-orange-900 border-orange-300 hover:bg-orange-200", checked: "peer-checked:bg-orange-800 peer-checked:text-white peer-checked:border-orange-800" }, # 落ち着いた茶色(orange-800)
    '調和・平和' => { base: "bg-green-100 text-green-800 border-green-300 hover:bg-green-200", checked: "peer-checked:bg-green-500 peer-checked:text-white peer-checked:border-green-500" } # 緑
  }.freeze

  def tag_color_classes(tag_name)
    TAG_COLOR_CONFIGS[tag_name] || { base: "bg-gray-100 text-gray-800 border-gray-300", checked: "peer-checked:bg-gray-500 peer-checked:text-white" }
  end

  # 画面表示用のグループ分け
  def emotion_groups
    [
      ['喜び・楽しさ', '笑顔・ユーモア'],
      ['ワクワク・好奇心', '熱狂・興奮', '勇気・闘志'],
      ['安心・安らぎ', '共感・救済', '愛おしさ・感謝'],
      ['涙・号泣', '喪失感・ノスタルジー','感動・発見'],
      ['衝撃・圧倒', '迷い・葛藤', '恐怖・スリル', '怒り・反骨']
    ]
  end

  def value_groups
    [
      { title: "前に進む軸", tags: ['挑戦・成長', '努力・継続', '自由・自立', '野心・成功', '情熱・没頭'] },
      { title: "人と繋がる軸", tags: ['家族・友情', '愛情・思いやり', '寛容・多様性'] },
      { title: "自己を見つめる軸", tags: ['誠実・自分らしさ', '内省・孤独', '美意識・感性', '知性・探究心'] },
      { title: "世界と関わる軸", tags: ['正義・信念', '貢献・利他', '伝統・文化', '調和・平和'] }
    ]
  end
end