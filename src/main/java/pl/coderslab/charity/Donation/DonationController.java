package pl.coderslab.charity.Donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;

import javax.validation.Valid;

@Controller
public class DonationController {

    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;


    public DonationController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("institution", institutionRepository.findAll());
        model.addAttribute("category",categoryRepository.findAll());
        return "form";
    }

    @PostMapping("/add")
    public String donationAdd(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "form";
        }
        donationRepository.save(donation);
        return "confirmation";
    }



}
