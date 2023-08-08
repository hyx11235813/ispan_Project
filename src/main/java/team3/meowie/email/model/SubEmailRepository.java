package team3.meowie.email.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubEmailRepository extends JpaRepository<SubEmail, Long> {
}
