package pl.coderslab.charity.Donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value="SELECT sum(quantity) FROM donations where quantity>0", nativeQuery = true)
    Integer countQuantity();



}
