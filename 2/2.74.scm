
(load "./myutil.scm")
(load "./table.scm")

;;;;;;;;; 各事業所に適用できる get-record

;事業所 A
; 基本的にはデータ構造はなんでもよい。
; ただ、型情報として各事業所の名前が入っている必要がある
; (list '(John john@gmail.com 3000) '(mike mike@gmail.com 4000) )


; 各事業所ファイル自体が、先頭にタグを持っている
(define a-file
    (list 'a '("John" "john@gmail.com" 3000) '("Mike" "mike@gmail.com" 4000) )
)
(define (get-tag file) (car file))

(define (install-a)
    (define (get-records file) (cdr file))
    (define (_get-record records) (car records))
    (define (get-another-record records) (cdr records))
    (define (username record) (car record))
    (define (address record) (cadr record))
    (define (salary record) (caddr record))

    (define (get-record file name)
      (define (inner records)
          (if (null? records)
              #f
              (if (string=? name (username (_get-record records)))
                  (_get-record records)
                  (inner (get-another-record records))
              )
          )
      )
      (inner (get-records file))
    )

    ; 外部インタフェース
    (put 'get-record 'a get-record)
    (put 'get-salary 'a salary)
)

;事業所 B
; (list 'b '('username John 'address john@gmail.com 'sarary 3000) '('username mike 'address mike@gmail.com 'sarary 4000) )

(define b-file
  (list 'b
    '((username "John-b") (address "john-b@gmail.com") (salary 5000))
    '((username "Mike-b") (address "mike-b@gmail.com") (salary 6000))
  ))

(define (install-b)
    (define (get-records file) (cdr file))
    (define (_get-record records) (car records))
    (define (get-another-record records) (cdr records))

    (define (get-record file name)
      (define (inner records)
          (if (null? records)
              #f
              (if (string=? name (username (_get-record records)))
                  (_get-record records)
                  (inner (get-another-record records))
              )
          )
      )
      (inner (get-records file))
    )

    (define (_pick sym record)
      (filter (lambda (attribute) (equal? (car attribute) sym)) record)
      )
    (define (username record)
      (cadar (_pick 'username record))
      )
    (define (address record)
      (cadar (_pick 'address record))
      )
    (define (salary record)
      (cadar (_pick 'salary record))
      )

    ; 外部インタフェース
    (put 'get-record 'b get-record)
    (put 'get-salary 'b salary)
)


(install-a)
(install-b)
(define (get-record file username)
  (define tag (get-tag file))
  (define f (get 'get-record tag))
  (define record (f file username))
  (if record (list tag record) false)
)

(p (get-record a-file "John"))
(p (get-record b-file "John-b"))
(p (get-record a-file "John gari a"))
(p (get-record b-file "John gari a"))

(define (get-salary record)
  (define (data record) (cadr record))
  (define f (get 'get-salary (get-tag record)))
  (if f
      (f (data record))
      false
      )
)


; b. 本部のために, いずれの事業所の従業員ファイルからでも与えられた従業員のレコードから, 給与の情報を返すget-salary手続きを実装せよ. この演算が働くためには, レコードをどう構造化すべきか.
; 各レコードが、どの事業所のレコードかを保持する必要がある。
; データ構造的に レコードに 保持するか、インタフェースである get-record が
; 事業所情報を一緒に返すかの実装方法が思いついたが、後者のほうがラクだし
; データ量もお得なので後者で実装する

(p (get-salary (get-record a-file "John")))
(p (get-salary (get-record b-file "John-b")))


; c. 本部のために, find-employee-record手続きを実装せよ. すべての事業所ファイルから与えられた従業員のレコードを探し, それを返すものとする. この手続きは引数として従業員の名前と全事業所ファイルのリストをとるものと仮定せよ.

(define (find-employee-record username files)
  (if (null? files)
      #f
      (let ((record (get-record (car files) username)))
      (if record
          record
          (find-employee-record username (cdr files))
          )
      )
      )
)

(p (find-employee-record "John" (list a-file b-file)))
(p (find-employee-record "John-b" (list a-file b-file)))
(p (find-employee-record "Mike" (list a-file b-file)))
(p (find-employee-record "Miiiiiiiiiike" (list a-file b-file)))

; d. この企業が, 別の会社を合併した時, 新しい従業員情報を中央システムに組み込むには, どういう変更をすべきか.
;a, b と同じように、 install-c を作成するだけ。(file の先頭に事業所識別子が必要)


