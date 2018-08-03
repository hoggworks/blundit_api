json.prediction do
  json.id @prediction.id
  json.title @prediction.title
  json.description @prediction.description
  json.pic @prediction.pic.url
  json.alias @prediction.alias
  json.categories @prediction.categories.each do |category|
    json.id category.id
    json.name category.name
  end
  json.comments_count @prediction.prediction_comments_count
  json.votes_count @prediction.votes.count
  json.all_votes_count @prediction.all_votes.count
  json.vote_value @prediction.vote_value

  json.status @prediction.status

  json.number_of_experts @prediction.experts.count
  json.prediction_date @prediction.prediction_date
  json.open @prediction.open?
  json.user_vote @user_vote
  json.bookmark @bookmark

  json.evidences @prediction.evidences.order('updated_at DESC').each do |evidence|
    json.title evidence.title
    json.url evidence.url
    json.description evidence.description
    json.image evidence.image
  end
end
json.experts @prediction.prediction_experts.order('updated_at DESC').each do |pe|
  json.id pe.expert.id
  json.alias pe.expert.alias
  json.name pe.expert.name
  json.accuracy pe.expert.accuracy
  json.avatar pe.expert.avatar.url(:thumb)
  if ExpertPrediction.where({prediction_id: @prediction.id, expert_id: pe.expert.id}).length > 0
    json.evidence_of_beliefs ExpertPrediction.where({prediction_id: @prediction.id, expert_id: pe.expert.id}).first.evidence_of_beliefs.count
  else
    json.evidence_of_beliefs 0
  end
end