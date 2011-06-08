require 'excon'
require 'nokogiri'

class Metanym
  VERSION = "0.1.0"
  URL = "http://thesaurus.com/browse/"

  def initialize(query)
    @url = URI.encode(URL + query)
  end

  def synonyms
    @synonyms ||= items_at 'Synonyms'
  end

  def antonyms
    @antonyms ||= items_at 'Antonyms'
  end

  def definition
    @definition ||= doc.at_xpath('//td[.="Definition:"]/following::td').text
  rescue NoMethodError
    nil
  end

  def items_at(head)
    doc.at_xpath("//td[.='#{head}:']/following-sibling::td").text.strip.split(/[\n,]\s*/)
  rescue NoMethodError
    []
  end

  def doc
    @doc ||= Nokogiri.HTML source
  end

  def source
    Excon.get(@url, :method => 'GET', :expects => 200, :headers => {"User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.A.B.C Safari/525.13"}).body
  end 

end