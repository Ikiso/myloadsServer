package database

import "MyLoads/pkg/models"

func (s *Server) GetAllBids() ([]models.Bid, []models.Bid, error) {
	var bids []models.Bid
	var nonDuplicateBids []models.Bid
	err := s.Db["AUCTION"].Table("bid").Find(&bids).Error
	//err = s.Db["AUCTION"].Raw("SELECT DISTINCT bid.company_id, bid.creator_id, bid.email, bid.name, bid.phone, bid.rating FROM bid").
	//	Find(&nonDuplicateBids).Error

	err = s.Db["AUCTION"].Raw("SELECT DISTINCT bid.company_id, bid.name FROM bid GROUP BY bid.company_id, bid.name ORDER BY company_id").
		Find(&nonDuplicateBids).Error

	if err != nil {
		return bids, nonDuplicateBids, err
	}

	return bids, nonDuplicateBids, nil
}
