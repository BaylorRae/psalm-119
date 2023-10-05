class VersesController < ApplicationController
  def index
    @verses = Verse.order(:number).in_groups_of(8)
  end

  def show
    @verse = Verse.find_by!(number: params[:number])
    @commentaries = @verse.commentaries
    ahoy.track "$verse", {verse: @verse.number}
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  LETTERS = [
    "א ALEPH",
    "ב BETH",
    "ג GIMEL",
    "ד DALETH",
    "ה HE",
    "ו VAU",
    "ז ZAIN",
    "ח CHETH",
    "ט TETH",
    "י JOD",
    "כ CAPH",
    "ל LAMED",
    "מ MEM",
    "נ NUN",
    "ס SAMECH",
    "ע AIN",
    "פ PE",
    "צ TZADDI",
    "ק KOPH",
    "ר RESH",
    "ש SCHIN",
    "ת TAU"
  ]
end
