class AddSeedChapters < ActiveRecord::Migration
  def change
    m = Mangdown::PopularManga.new('http://www.mangareader.net/popular', 100)
    m.mangas_list.each do |manga_md|
      begin
        manga = manga_md.to_manga 
        chap = manga.chapters_list.last.to_chapter 
        manga = chap.instance_variable_get(:@manga)
        number = chap.instance_variable_get(:@chapter)
        page = chap.pages.first.uri
        Chapter.create(manga: manga, number: number, image_url: page)
      rescue Exception => error
        puts error.message
        next
      end
    end
  end
end
