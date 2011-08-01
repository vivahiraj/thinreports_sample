#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'thinreports'

report = ThinReports::Report.new :layout => 'test_test.tlf'
report.start_new_page do |page|
  page.item(:aaa).value('おらおら')
  list = page.list(:test_list)
  data = [['コード１','おなまえ１','バルバル'],
          ['コード２２','おなまえ１２','バルバルバル'],
          ['コード２２３３３','おなまえ１２３４５','バルバルバル場るバルバル'],
          ['コード２２３３３44455555','おなまえ１２３４５67890','バルバルバル場るバルバルバリバリバリバリ'],
          ['コード２２３３３44455555６６７７８８','おなまえ１２３４５67890なまえ～～～～','バルバルバル場るバルバルバリバリバリバリバロバロバロ'],
         ]
  data.each do |d|
    list.add_row do |row|
      row.item(:code).value(d[0])
      row.item(:name).value(d[1])
      row.item(:valval).value(d[2])
    end
  end
end

report.start_new_page do |page|
  page.item(:aaa).value('オラオラオラオラオラオラオラオラオラオラオラオラオロオラオラオラオラオラオラオラオラララララララララララララ')
  list = page.list(:test_list)
  for i in 0..50
    list.add_row do |row|
      row.item(:code).value('code' + i.to_s)
      row.item(:name).value('name' + i.to_s)
      row.item(:valval).value('valval' + i.to_s)
    end
  end
end

File.open('test_out.pdf', 'w') do |f|
   f.puts report.generate(:pdf)
end

puts 'Done'
