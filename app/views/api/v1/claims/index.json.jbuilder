json.claims @claims.each do |claim|
  json.id claim.id
  json.alias claim.alias
  json.description claim.description
  json.created_at claim.created_at
  json.title claim.title
  json.comments_count claim.comments_count
  json.votes_count claim.votes_count
  json.status claim.status

  json.categories claim.categories.each do |category|
    json.id category.id
    json.name category.name
  end

  json.number_of_experts claim.experts.count
  json.recent_experts claim.claim_experts.order('updated_at DESC').limit(3).each do |ce|
    json.id ce.expert.id
    json.name ce.expert.name
    json.alias ce.expert.alias
    json.avatar ce.expert.avatar.url(:thumb)
  end

  json.vote_value claim.vote_value
  if claim.status == 0 and claim.vote_value.nil?
    json.status "unknown"
  elsif claim.status == 0 and !claim.vote_value.nil?
    json.status "false"
  elsif claim.status == 1 and !claim.vote_value.nil? and claim.vote_value >= 0.5
    json.status "true"
  elsif claim.status == 1 and !claim.vote_value.nil? and claim.vote_value < 0.5
    json.status "false"
  end
end
json.page @current_page
json.per_page @per_page
json.number_of_pages @claims.total_pages