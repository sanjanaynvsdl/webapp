package ai.elimu.dao.jpa;

import ai.elimu.model.contributor.WordContributionEvent;
import ai.elimu.dao.WordContributionEventDao;
import ai.elimu.model.content.Word;
import java.util.List;
import org.springframework.dao.DataAccessException;

public class WordContributionEventDaoJpa extends GenericDaoJpa<WordContributionEvent> implements WordContributionEventDao {

    @Override
    public List<WordContributionEvent> readAll(Word word) throws DataAccessException {
        return em.createQuery(
            "SELECT wce " + 
            "FROM WordContributionEvent wce " +
            "WHERE wce.word = :word " + 
            "ORDER BY wce.time DESC")
            .setParameter("word", word)
            .getResultList();
    }
}