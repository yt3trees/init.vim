;; extends
; #をタイトルと同じ色にする
[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @text.title

; 引用箇所全体をコメントと同じ色にする
[
  (block_quote)
  (block_quote_marker)
] @comment

(list_item
  (list_marker_minus)
  (task_list_marker_checked)
  (paragraph)
) @comment

